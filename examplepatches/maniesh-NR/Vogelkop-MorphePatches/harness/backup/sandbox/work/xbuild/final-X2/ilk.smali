.class public final Lilk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llnf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lpde;

.field public final c:Lebh;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;Lebh;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lilk;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lilk;->b:Lpde;

    iput-object p3, p0, Lilk;->c:Lebh;

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;ZLandroid/os/Parcelable;)Lknf;
    .registers 15

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, p0, Lilk;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    new-instance v0, Lhlk;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v4

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v5

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object v6

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v7

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object v9

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v10

    iget-object v2, p0, Lilk;->b:Lpde;

    iget-object v8, p0, Lilk;->c:Lebh;

    invoke-direct/range {v0 .. v10}, Lhlk;-><init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;Lslk;Lydn;Lxb;Ljtg;Lebh;Lgmk;Lru9;)V

    return-object v0
.end method
