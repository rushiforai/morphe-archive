.class public final synthetic Ll/tn00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/xn00;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:[Ll/nqy;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/xn00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tn00;->a:Ll/xn00;

    iput-object p2, p0, Ll/tn00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/tn00;->c:[Ll/nqy;

    iput-object p4, p0, Ll/tn00;->d:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tn00;->a:Ll/xn00;

    iget-object v1, p0, Ll/tn00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/tn00;->c:[Ll/nqy;

    iget-object p0, p0, Ll/tn00;->d:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, v2, p0, p1}, Ll/xn00;->c(Ll/xn00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
