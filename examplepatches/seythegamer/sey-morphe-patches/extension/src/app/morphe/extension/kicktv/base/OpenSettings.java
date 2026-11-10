package app.morphe.extension.kicktv.base;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/**
 * Click callback installed on the Settings row by the SEYTTINGS patch. KICK
 * passes an event object to Function1 callbacks, which is ignored here.
 */
public final class OpenSettings implements Function1<Object, Unit> {

    @Override
    public Unit invoke(Object event) {
        MorpheSettings.show(MorpheContext.getActivity());
        return Unit.INSTANCE;
    }
}
