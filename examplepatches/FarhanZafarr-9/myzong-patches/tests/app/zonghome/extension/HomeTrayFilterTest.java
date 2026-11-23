package app.zonghome.extension;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import android.view.View;
import android.view.ViewGroup;
/** Pending source-only test cases. Not compiled or run until builds are authorized again. */
public class HomeTrayFilterTest {
    public static class Item {
        final String name;
        public Item(String name) { this.name = name; }
        public String getName() { return name; }
    }
    public static void main(String[] args) {
        Item rewards = new Item("Rewards"), shop = new Item("Rs. 100 Shop");
        Item history = new Item("Brief History"), unknown = new Item("Future promotion");
        List<Item> input = new ArrayList<>(Arrays.asList(history, rewards, unknown, shop));
        List<?> selected = HomeTrayFilter.filter(input);
        if (!selected.equals(Arrays.asList(rewards, shop))) throw new AssertionError("Exact requested defaults/order");
        if (input.size() != 4 || input.get(0) != history) throw new AssertionError("Input/database list mutated");
        if (!HomeTrayFilter.filterWithKeys(input, "briefhistory").equals(Arrays.asList(history)))
            throw new AssertionError("Alternate individual selection");
        if (!HomeTrayFilter.filterWithKeys(input, "").isEmpty()) throw new AssertionError("Empty selection");
        if (!HomeTrayFilter.filterWithKeys(input, " REWARDS |RS100SHOP|rewards").equals(selected))
            throw new AssertionError("Case, punctuation, spacing or repeated selections");
        if (HomeTrayFilter.filter(null) != null) throw new AssertionError("Changed original null handling");
        Item freeMbs = new Item("Free MBs");
        if (!HomeTrayFilter.filterWithKeys(Arrays.asList(freeMbs, shop), "Rewards|Rs 100 Shop").equals(Arrays.asList(freeMbs, shop)))
            throw new AssertionError("Server Free MBs alias was hidden");
        if (!HomeTrayFilter.filterWithKeys(input, "Free MBs").equals(Arrays.asList(rewards)))
            throw new AssertionError("Free MBs selection did not preserve Rewards");
        HomeTrayFilter.filterWithKeys(input,"rewards|rs100shop");
        View root=new View(),card=root.add("cardTray",1),grid=root.add("rvHomeTray",2),more=root.add("viewMoreBtn",3);
        ViewGroup.LayoutParams cardParams=new ViewGroup.LayoutParams(300,190);
        card.setLayoutParams(cardParams);card.setMinimumHeight(90);card.setPadding(16,16,16,16);
        ViewGroup.MarginLayoutParams gridParams=new ViewGroup.MarginLayoutParams(300,48);
        gridParams.topMargin=10;gridParams.bottomMargin=20;
        grid.setLayoutParams(gridParams);grid.layout(0,0,300,48);
        HomeTrayFilter.attach(root);root.attach();
        if(root.getViewTreeObserver().draw() || cardParams.height!=110 || card.getMinimumHeight()!=0 || more.getVisibility()!=View.GONE)
            throw new AssertionError("Compact small grid and remove redundant View More");
        if(!root.getViewTreeObserver().draw())throw new AssertionError("Sizing did not settle");
        HomeTrayFilter.filterWithKeys(Arrays.asList(rewards,rewards,rewards,rewards,rewards,rewards,rewards,rewards,rewards),"rewards");
        root.getViewTreeObserver().draw();
        if(cardParams.height!=190 || card.getMinimumHeight()!=90 || more.getVisibility()!=View.VISIBLE)
            throw new AssertionError("Large grid did not restore original expand controls");
        root.detach();
        if(!root.getViewTreeObserver().listeners.isEmpty())throw new AssertionError("Sizing observer leaked");
        System.out.println("PASS: pending home-tray selection tests");
    }
}
