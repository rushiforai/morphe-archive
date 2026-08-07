.class public final synthetic Ll/drm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/erm0;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/erm0;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/drm0;->a:Ll/erm0;

    iput-object p2, p0, Ll/drm0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/drm0;->a:Ll/erm0;

    iget-object p0, p0, Ll/drm0;->b:Ll/y20;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/erm0;->X3(Ll/erm0;Ll/y20;Ll/pf60;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
