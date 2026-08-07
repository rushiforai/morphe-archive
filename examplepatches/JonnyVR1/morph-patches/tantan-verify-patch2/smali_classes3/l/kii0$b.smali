.class public Ll/kii0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kii0;->i0(Ll/xc00;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Ll/xc00;

.field public final synthetic d:Ll/kii0;


# direct methods
.method public constructor <init>(Ll/kii0;Ljava/lang/String;ZLl/xc00;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/kii0$b;->d:Ll/kii0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kii0$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/kii0$b;->b:Z

    .line 6
    .line 7
    iput-object p4, p0, Ll/kii0$b;->c:Ll/xc00;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/kii0$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/kii0$b;->d:Ll/kii0;

    .line 10
    .line 11
    iget-object v0, p0, Ll/kii0$b;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/wc00;->F(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-boolean p1, p0, Ll/kii0$b;->b:Z

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/kii0$b;->c:Ll/xc00;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
