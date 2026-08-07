.class public final synthetic Ll/gf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/of7;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/of7;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gf7;->a:Ll/of7;

    iput-object p2, p0, Ll/gf7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/gf7;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gf7;->a:Ll/of7;

    iget-object v1, p0, Ll/gf7;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/gf7;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Ll/of7;->d(Ll/of7;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
