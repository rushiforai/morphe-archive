.class public final synthetic Ll/cm8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cm8;->a:Ll/y20;

    iput-object p2, p0, Ll/cm8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/cm8;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/cm8;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cm8;->a:Ll/y20;

    iget-object v1, p0, Ll/cm8;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/cm8;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/cm8;->d:Ll/x20;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->d1(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    return-void
.end method
