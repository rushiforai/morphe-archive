.class public final synthetic Ll/om8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VButton;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Lv/VButton;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/om8;->a:Lv/VButton;

    iput-object p2, p0, Ll/om8;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/om8;->c:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/om8;->a:Lv/VButton;

    iget-object v1, p0, Ll/om8;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/om8;->c:Ll/jl80;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->b1(Lv/VButton;Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/Long;)V

    return-void
.end method
