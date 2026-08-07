.class public Ll/zae0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zae0;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/zae0;


# direct methods
.method public constructor <init>(Ll/zae0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/zae0$a;->e:Ll/zae0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zae0$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Ll/zae0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/zae0$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/zae0$a;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_agree"

    .line 2
    .line 3
    const-string v0, "p_paip_choose_avatar_switch_pop"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/zae0$a;->e:Ll/zae0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/zae0$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object v1, p0, Ll/zae0$a;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p0, Ll/zae0$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Ll/zae0$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, v0, v1, v2, p0}, Ll/zae0;->l(Ll/zae0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
