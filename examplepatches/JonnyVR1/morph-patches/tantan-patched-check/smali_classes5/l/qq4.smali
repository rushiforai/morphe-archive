.class public final synthetic Ll/qq4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/bm5;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qq4;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/qq4;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/qq4;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/qq4;->d:Ll/bm5;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qq4;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/qq4;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/qq4;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/qq4;->d:Ll/bm5;

    invoke-static {v0, v1, v2, p0, p1}, Ll/pq4$b;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/bm5;Landroid/view/View;)V

    return-void
.end method
