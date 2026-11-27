package com.facebook.graphservice.interfaces;

/** The GraphQL tree's interface, here only for the field types a tree answers with, which keep their names in every build. */
public interface Tree {
    enum FieldType {
        NONE, BOOL, DOUBLE, INT, TIME, STRING, DYNAMIC, BOOL_LIST, DOUBLE_LIST, INT_LIST, TIME_LIST, STRING_LIST, TREE, TREE_LIST
    }
}
