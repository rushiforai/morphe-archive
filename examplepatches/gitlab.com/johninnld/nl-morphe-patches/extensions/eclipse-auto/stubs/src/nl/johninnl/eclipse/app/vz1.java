package nl.johninnl.eclipse.app;

/** Kotlin's ContinuationImpl (R8 name vz1): the type R8 narrowed the loaders' parameters to. */
public abstract class vz1 extends cr0 {
    private final tz1 completion;

    public vz1(tz1 completion) {
        super(completion);
        this.completion = completion;
    }

    @Override public c12 getContext() { return completion.getContext(); }
}
