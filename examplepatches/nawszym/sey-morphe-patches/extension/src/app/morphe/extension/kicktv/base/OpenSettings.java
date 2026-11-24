package app.morphe.extension.kicktv.base;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/**
 * Click callback installed on the Settings row by the SEYTTINGS patch. KICK
 * passes an event object to Function1 callbacks, which is ignored here.
 *
 * <p>Uses a raw {@link Function1} (no type parameters) so javac does not emit
 * a {@code Signature} attribute and there is no synthetic bridge method whose
 * {@code MethodParameters} entry would trip R8 8.2.2-dev (it calls
 * {@code String.length()} on a null parameter name and aborts dexing).</p>
 */
public final class OpenSettings implements Function1 {

    @Override
    public Object invoke(Object event) {
        MorpheSettings.show(MorpheContext.getActivity());
        return Unit.INSTANCE;
    }
}
