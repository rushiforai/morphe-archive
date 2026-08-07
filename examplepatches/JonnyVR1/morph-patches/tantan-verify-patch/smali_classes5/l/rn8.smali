.class public final synthetic Ll/rn8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rn8;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/rn8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/rn8;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rn8;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/rn8;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/rn8;->c:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->b0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method
