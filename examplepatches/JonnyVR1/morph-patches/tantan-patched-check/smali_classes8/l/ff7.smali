.class public final synthetic Ll/ff7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/of7;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/of7;ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ff7;->a:Ll/of7;

    iput-boolean p2, p0, Ll/ff7;->b:Z

    iput-object p3, p0, Ll/ff7;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/ff7;->d:Z

    iput-object p5, p0, Ll/ff7;->e:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ff7;->a:Ll/of7;

    iget-boolean v1, p0, Ll/ff7;->b:Z

    iget-object v2, p0, Ll/ff7;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/ff7;->d:Z

    iget-object v4, p0, Ll/ff7;->e:Lcom/p1/mobile/android/app/Act;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/of7;->e(Ll/of7;ZLjava/lang/String;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
