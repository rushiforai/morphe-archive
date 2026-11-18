package nl.johninnl.wuplaycar;
import java.util.Deque;
import java.util.function.Predicate;
import java.util.function.Consumer;
/** Preserve the root while restoring a matching native stream page. */
public final class NavigationStack {
    public static <T> boolean rewind(Deque<T> stack,Predicate<T> target,Consumer<T> closed){
        while(stack.size()>1){if(target.test(stack.peekLast()))return true;closed.accept(stack.removeLast());}
        return !stack.isEmpty()&&target.test(stack.peekLast());
    }
    public static <T> boolean current(Deque<T> stack,T owner,boolean ended){return !ended&&stack.peekLast()==owner;}
    private NavigationStack(){}
}
