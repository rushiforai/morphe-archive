package X;
import com.facebook.navigation.tabbar.state.model.TabTag;
// Instances in the real tab list are subclasses, so the A03 lookup must walk up to the base class.
public final class FakeTab extends TabTag { public FakeTab(long id){ super(id); } }
