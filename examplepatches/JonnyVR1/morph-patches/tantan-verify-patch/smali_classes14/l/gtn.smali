.class public final synthetic Ll/gtn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mvn;


# direct methods
.method public synthetic constructor <init>(Ll/mvn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gtn;->a:Ll/mvn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gtn;->a:Ll/mvn;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveActivitiesApi;->a(Ll/mvn;Ljava/lang/Throwable;)Ll/mvn;

    move-result-object p0

    return-object p0
.end method
