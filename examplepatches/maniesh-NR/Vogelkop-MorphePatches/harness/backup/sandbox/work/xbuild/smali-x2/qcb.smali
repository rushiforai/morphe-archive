.class public final synthetic Lqcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:Lp12;

.field public final synthetic b:Lcom/opera/android/BrowserActivity;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lp12;Lcom/opera/android/BrowserActivity;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqcb;->a:Lp12;

    iput-object p2, p0, Lqcb;->b:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Lqcb;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 8

    iget-object v0, p0, Lqcb;->a:Lp12;

    iget-object v0, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Le4i;

    sget-object v4, Lo3i;->c:Lo3i;

    iget-object v0, v2, Le4i;->a:Lk3i;

    invoke-virtual {v0}, Lk3i;->a()Likc;

    move-result-object v6

    new-instance v1, Ld4i;

    iget-object v3, p0, Lqcb;->b:Lcom/opera/android/BrowserActivity;

    iget-object v5, p0, Lqcb;->c:Ljava/lang/String;

    invoke-direct/range {v1 .. v6}, Ld4i;-><init>(Le4i;Lndc;Lo3i;Ljava/lang/String;Likc;)V

    invoke-virtual {v6, v3, v1}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method
