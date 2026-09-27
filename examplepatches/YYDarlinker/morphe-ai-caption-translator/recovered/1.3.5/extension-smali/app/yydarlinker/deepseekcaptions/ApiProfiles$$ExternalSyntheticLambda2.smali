.class public final synthetic Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic f$0:Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;


# direct methods
.method public synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticLambda2;->f$0:Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 2

    .line 0
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticLambda2;->f$0:Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;

    check-cast p1, Ljava/lang/ref/WeakReference;

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->lambda$unregister$1(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;Ljava/lang/ref/WeakReference;)Z

    move-result p0

    return p0
.end method
