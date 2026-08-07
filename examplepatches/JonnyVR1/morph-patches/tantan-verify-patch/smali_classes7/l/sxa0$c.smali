.class public Ll/sxa0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sxa0;->L(ILl/x20;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/sxa0;


# direct methods
.method public constructor <init>(Ll/sxa0;ILl/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sxa0$c;->c:Ll/sxa0;

    .line 2
    .line 3
    iput p2, p0, Ll/sxa0$c;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/sxa0$c;->b:Ll/x20;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/sxa0$c;->c:Ll/sxa0;

    .line 2
    .line 3
    iget v0, p0, Ll/sxa0$c;->a:I

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/sxa0;->C(Ll/sxa0;I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_selected_users_complete_profile"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/sxa0$c;->c:Ll/sxa0;

    .line 15
    .line 16
    invoke-static {p1}, Ll/sxa0;->z(Ll/sxa0;)Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/sxa0$c$a;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/sxa0$c$a;-><init>(Ll/sxa0$c;)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {p1, v0, v1}, Ll/ou90;->m(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/sxa0$c;->c:Ll/sxa0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 32
    .line 33
    .line 34
    return-void
.end method
