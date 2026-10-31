package com.google.firebase.components;

import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes3.dex */
public class DependencyCycleException extends DependencyException {
    public DependencyCycleException(ArrayList arrayList) {
        super("Dependency cycle detected: " + Arrays.toString(arrayList.toArray()));
    }
}
