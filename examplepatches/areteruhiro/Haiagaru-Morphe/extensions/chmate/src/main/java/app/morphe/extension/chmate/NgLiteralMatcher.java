package app.morphe.extension.chmate;

import java.util.*;

/** Immutable multi-pattern UTF-16 substring search; identical to any String.contains. */
final class NgLiteralMatcher {
    private static final int MAX_CHARACTERS=200_000;
    private static final class Node {
        final Map<Character,Node> next=new HashMap<>();
        Node fail;boolean terminal;
    }
    private final Node root;
    private final String[] linear;
    NgLiteralMatcher(Collection<String> patterns) {
        Set<String> unique=new LinkedHashSet<>(patterns);
        long characters=0;for(String word:unique)characters+=word.length();
        // Tiny sets benefit from String's intrinsic; bound the extra trie memory.
        if(unique.size()<8||characters>MAX_CHARACTERS){linear=unique.toArray(new String[0]);root=null;return;}
        linear=null;root=new Node();root.fail=root;
        for(String word:unique){
            Node node=root;
            for(int i=0;i<word.length();i++){
                char c=word.charAt(i);Node next=node.next.get(c);
                if(next==null){next=new Node();node.next.put(c,next);}node=next;
            }
            node.terminal=true;
        }
        ArrayDeque<Node> queue=new ArrayDeque<>();
        for(Node child:root.next.values()){child.fail=root;child.terminal|=root.terminal;queue.add(child);}
        while(!queue.isEmpty()){
            Node parent=queue.remove();
            for(Map.Entry<Character,Node> edge:parent.next.entrySet()){
                char c=edge.getKey();Node child=edge.getValue(),fallback=parent.fail;
                while(fallback!=root&&!fallback.next.containsKey(c))fallback=fallback.fail;
                Node suffix=fallback.next.get(c);child.fail=suffix==null?root:suffix;
                child.terminal|=child.fail.terminal;queue.add(child);
            }
        }
    }
    boolean matches(String text) {
        if(root==null){for(String word:linear)if(text.contains(word))return true;return false;}
        if(root.terminal)return true;
        Node node=root;
        for(int i=0;i<text.length();i++){
            char c=text.charAt(i);Node next=node.next.get(c);
            while(next==null&&node!=root){node=node.fail;next=node.next.get(c);}
            node=next==null?root:next;
            if(node.terminal)return true;
        }
        return false;
    }
}
