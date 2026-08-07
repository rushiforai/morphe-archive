.class public final synthetic Ll/lj50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rj50;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/rj50;Lcom/p1/mobile/android/app/Act;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lj50;->a:Ll/rj50;

    iput-object p2, p0, Ll/lj50;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/lj50;->c:Z

    iput-object p4, p0, Ll/lj50;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lj50;->a:Ll/rj50;

    iget-object v1, p0, Ll/lj50;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean v2, p0, Ll/lj50;->c:Z

    iget-object p0, p0, Ll/lj50;->d:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    invoke-static {v0, v1, v2, p0, p1}, Ll/rj50;->G(Ll/rj50;Lcom/p1/mobile/android/app/Act;ZLl/y20;Lcom/p1/mobile/putong/data/OMSDialogInfo;)V

    return-void
.end method
