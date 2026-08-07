.class public Ll/kii0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kii0;->i0(Ll/xc00;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;

.field public final synthetic c:Ll/kii0;


# direct methods
.method public constructor <init>(Ll/kii0;Ll/xc00;Lv/navigationbar/VNavigationBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/kii0$a;->c:Ll/kii0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kii0$a;->a:Ll/xc00;

    .line 4
    .line 5
    iput-object p3, p0, Ll/kii0$a;->b:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kii0$a;->a:Ll/xc00;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xc00;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/kii0$a;->b:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
