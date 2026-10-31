/*
 *  Copyright (C) 2022 github.com/REAndroid
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.reandroid.utils;

import com.reandroid.utils.collection.ArrayIterator;
import com.reandroid.utils.collection.EmptyIterator;
import com.reandroid.utils.collection.FilterIterator;
import com.reandroid.utils.collection.InstanceIterator;
import com.reandroid.utils.collection.SingleIterator;

import java.util.AbstractSet;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.function.Predicate;


/**
 * A utility class to hold few non-null objects, the main purpose is to minimize new HashSet class creation.
 *    <br />If no entries, the container will be null.
 *    <br />If one entry, the container will become entry itself.
 *    <br />If more than one entry, a compact hash set is created and becomes the container.
 * */

public class HashSetStore {

    public static boolean isEmpty(Object container) {
        if (container == null) {
            return true;
        }
        if (container.getClass() == ObjectsSet.class) {
            return ((ObjectsSet) container).isEmpty();
        }
        return false;
    }
    public static int size(Object container) {
        if (container == null) {
            return 0;
        }
        if (container.getClass() == ObjectsSet.class) {
            return ((ObjectsSet) container).size();
        }
        return 1;
    }
    public static boolean contains(Object container, Object item) {
        if (container == null) {
            return false;
        }
        if (container.getClass() == ObjectsSet.class) {
            return ((ObjectsSet) container).contains(item);
        }
        return container.equals(item);
    }
    public static<T> boolean containsIf(Object container, Predicate<T> predicate) {
        return iteratorIf(container, predicate).hasNext();
    }
    public static Object clear(Object container) {
        if (container != null && container.getClass() == ObjectsSet.class) {
            ((ObjectsSet) container).clear();
        }
        return null;
    }
    public static<T> Iterator<T> iterator(Object container) throws ClassCastException {
        Iterator<?> iterator;
        if (container == null) {
            iterator = EmptyIterator.of();
        } else if (container.getClass() == ObjectsSet.class) {
            iterator = ((ObjectsSet) container).iterator();
        } else {
            iterator = SingleIterator.of(container);
        }
        return ObjectsUtil.cast(iterator);
    }
    public static<T> Iterator<T> iterator(Object container, Class<T> instance) throws ClassCastException {
        Iterator<?> iterator;
        if (container == null) {
            iterator = EmptyIterator.of();
        } else if (container.getClass() == ObjectsSet.class) {
            iterator = ((ObjectsSet) container).iterator(instance);
        } else if (instance.isInstance(container)) {
            iterator = SingleIterator.of(container);
        } else {
            iterator = EmptyIterator.of();
        }
        return ObjectsUtil.cast(iterator);
    }
    public static<T> Iterator<T> clonedIterator(Object container) throws ClassCastException {
        Iterator<?> iterator;
        if (container == null) {
            iterator = EmptyIterator.of();
        } else if (container.getClass() == ObjectsSet.class) {
            iterator = ((ObjectsSet) container).clonedIterator();
        } else {
            iterator = SingleIterator.of(container);
        }
        return ObjectsUtil.cast(iterator);
    }
    public static<T> Iterator<T> iteratorIf(Object container, Predicate<T> predicate) throws ClassCastException {
        return FilterIterator.of(iterator(container), predicate);
    }
    public static Object remove(Object container, Object item) {
        if (item == null || container == null || item == container) {
            return null;
        }
        if (container.getClass() != ObjectsSet.class) {
            if (container.equals(item)) {
                container = null;
            }
            return container;
        }
        ObjectsSet set = (ObjectsSet) container;
        set.remove(item);
        int size = set.size();
        if (size == 0) {
            return null;
        }
        if (size == 1) {
            return set.iterator().next();
        }
        return set;
    }
    public static Object add(Object container, Object item) {
        if (item == null || item == container) {
            return container;
        }
        if (container == null) {
            return item;
        }
        ObjectsSet set;
        if (container.getClass() == ObjectsSet.class) {
            set = (ObjectsSet) container;
        } else {
            set = new ObjectsSet();
            set.add(container);
        }
        set.add(item);
        return set;
    }
    public static Object addAll(Object container, Iterator<?> iterator) {
        if (iterator == null || !iterator.hasNext()) {
            return container;
        }
        Object first = iterator.next();
        if (!iterator.hasNext()) {
            return add(container, first);
        }
        ObjectsSet set;
        if (container != null && container.getClass() == ObjectsSet.class) {
            set = (ObjectsSet) container;
        } else {
            set = new ObjectsSet();
            if (container != null) {
                set.add(container);
            }
        }
        set.add(first);
        set.add(iterator.next());
        set.addAll(iterator);
        int size = set.size();
        if (size == 0) {
            return null;
        }
        if (size == 1) {
            return set.iterator().next();
        }
        return set;
    }
    public static Object addAll(Object container, Collection<?> collection) {
        if (collection == null || collection.isEmpty()) {
            return container;
        }
        ObjectsSet set;
        if (container != null && container.getClass() == ObjectsSet.class) {
            set = (ObjectsSet) container;
            set.addAll(collection);
        } else {
            if (container == null) {
                set = new ObjectsSet(collection);
            } else {
                set = new ObjectsSet();
                set.add(container);
                set.addAll(collection);
            }
        }
        int size = set.size();
        if (size == 0) {
            return null;
        }
        if (size == 1) {
            return set.getFirst();
        }
        return set;
    }
    public static Object addAll(Object container, Object[] itemsArray) {
        if (itemsArray == null || itemsArray.length == 0) {
            return container;
        }
        ObjectsSet set;
        if (container != null && container.getClass() == ObjectsSet.class) {
            set = (ObjectsSet) container;
            set.addAll(itemsArray);
        } else {
            if (container == null) {
                set = new ObjectsSet(itemsArray);
            } else {
                set = new ObjectsSet();
                set.add(container);
                set.addAll(itemsArray);
            }
        }
        int size = set.size();
        if (size == 0) {
            return null;
        }
        if (size == 1) {
            return set.getFirst();
        }
        return set;
    }
    public static void collect(Object container, Object[] array) {
        if (container == null || array == null || array.length == 0) {
            return;
        }
        if (container.getClass() == ObjectsSet.class) {
            ObjectsSet set = (ObjectsSet) container;
            set.toArrayFill(array);
        } else {
            array[0] = container;
        }
    }
    public static Object create(Object[] array) {
        if (array == null) {
            return null;
        }
        int length = array.length;
        if (length == 0) {
            return null;
        }
        if (length == 1) {
            return array[0];
        }
        return new ObjectsSet(array);
    }
    public static Object create(Iterator<?> iterator) {
        if (iterator == null || !iterator.hasNext()) {
            return null;
        }
        Object first = iterator.next();
        if (!iterator.hasNext()) {
            return first;
        }
        ObjectsSet set = new ObjectsSet();
        set.add(first);
        set.addAll(iterator);
        return set;
    }

    /**
     * Open addressing (linear probing) hash set. The containers here hold the
     * references of every string / spec string of a resource table, so per element
     * overhead matters: a HashSet costs a 32 byte node per element plus its table,
     * this costs one array slot.
     */
    static final class ObjectsSet extends AbstractSet<Object> {
        private static final int MIN_CAPACITY = 4;

        private Object[] table;
        private int size;

        ObjectsSet() {
            this.table = new Object[MIN_CAPACITY];
        }
        ObjectsSet(Object[] elements) {
            this.table = new Object[capacityFor(elements.length)];
            addAll(elements);
        }
        ObjectsSet(Collection<?> collection) {
            this.table = new Object[capacityFor(collection.size())];
            addAll(collection);
        }

        private static int capacityFor(int count) {
            int capacity = MIN_CAPACITY;
            // keep the load factor at or below 3/4
            while (capacity - (capacity >>> 2) < count) {
                capacity = capacity << 1;
            }
            return capacity;
        }
        private static int indexFor(Object element, int mask) {
            int h = element.hashCode() * 0x9E3779B9;
            return (h ^ (h >>> 16)) & mask;
        }
        /**
         * @return the slot holding <code>element</code>, or <code>-(slot + 1)</code> of the
         * empty slot where it would go
         */
        private int find(Object element) {
            Object[] table = this.table;
            int mask = table.length - 1;
            int i = indexFor(element, mask);
            Object existing;
            while ((existing = table[i]) != null) {
                if (existing == element || existing.equals(element)) {
                    return i;
                }
                i = (i + 1) & mask;
            }
            return -(i + 1);
        }

        @Override
        public int size() {
            return size;
        }
        @Override
        public boolean contains(Object o) {
            return o != null && find(o) >= 0;
        }
        /** Null is ignored, as {@link HashSetStore} never holds it */
        @Override
        public boolean add(Object element) {
            if (element == null) {
                return false;
            }
            int i = find(element);
            if (i >= 0) {
                return false;
            }
            Object[] table = this.table;
            table[-i - 1] = element;
            size ++;
            if (size > table.length - (table.length >>> 2)) {
                resize(table.length << 1);
            }
            return true;
        }
        private void resize(int capacity) {
            Object[] old = this.table;
            Object[] table = new Object[capacity];
            int mask = capacity - 1;
            for (Object element : old) {
                if (element != null) {
                    int i = indexFor(element, mask);
                    while (table[i] != null) {
                        i = (i + 1) & mask;
                    }
                    table[i] = element;
                }
            }
            this.table = table;
        }
        @Override
        public boolean remove(Object o) {
            int i = o == null ? -1 : find(o);
            if (i < 0) {
                return false;
            }
            Object[] table = this.table;
            int mask = table.length - 1;
            table[i] = null;
            size --;
            // shift back the following run so lookups never hit a gap
            int j = i;
            while (true) {
                j = (j + 1) & mask;
                Object element = table[j];
                if (element == null) {
                    break;
                }
                int k = indexFor(element, mask);
                boolean stays = (i <= j) ? (i < k && k <= j) : (i < k || k <= j);
                if (!stays) {
                    table[i] = element;
                    table[j] = null;
                    i = j;
                }
            }
            return true;
        }
        @Override
        public void clear() {
            Arrays.fill(this.table, null);
            this.size = 0;
        }
        @Override
        public Object[] toArray() {
            Object[] result = new Object[size];
            Object[] table = this.table;
            int index = 0;
            for (Object element : table) {
                if (element != null) {
                    result[index++] = element;
                }
            }
            return result;
        }
        @Override
        public Iterator<Object> iterator() {
            return new SlotIterator(table);
        }
        /**
         * Yields the occupied slots. Not an {@link ArrayIterator}, which would report the
         * table capacity as its size and make callers pre-size for empty slots.
         */
        private static final class SlotIterator implements Iterator<Object> {
            private final Object[] slots;
            private int position;

            SlotIterator(Object[] slots) {
                this.slots = slots;
                this.position = next(0);
            }
            private int next(int i) {
                Object[] slots = this.slots;
                while (i < slots.length && slots[i] == null) {
                    i ++;
                }
                return i;
            }
            @Override
            public boolean hasNext() {
                return position < slots.length;
            }
            @Override
            public Object next() {
                int i = this.position;
                if (i >= slots.length) {
                    throw new NoSuchElementException();
                }
                this.position = next(i + 1);
                return slots[i];
            }
        }
        public<T> Iterator<T> iterator(Class<? extends T> instance) {
            return ObjectsUtil.cast(InstanceIterator.of(iterator(), instance));
        }
        public Object getFirst() {
            if (!isEmpty()) {
                return iterator().next();
            }
            return null;
        }
        public Iterator<Object> clonedIterator() {
            return ArrayIterator.of(toArray());
        }
        public void addAll(Iterator<?> iterator) {
            while (iterator.hasNext()) {
                add(iterator.next());
            }
        }
        public void addAll(Object[] elements) {
            if (elements != null) {
                for (Object obj : elements) {
                    add(obj);
                }
            }
        }
        public void toArrayFill(Object[] out) {
            Object[] elements = toArray();
            int length = NumbersUtil.min(out.length, elements.length);
            System.arraycopy(elements, 0, out, 0, length);
        }
    }
}
