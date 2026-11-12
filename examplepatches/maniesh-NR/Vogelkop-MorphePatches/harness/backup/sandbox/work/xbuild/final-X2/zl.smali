.class public final Lzl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llnf;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Lpde;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;B)V
    .registers 4

    iput-byte p3, p0, Lzl;->a:B

    iput-object p1, p0, Lzl;->b:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lzl;->c:Lpde;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;ZLandroid/os/Parcelable;)Lknf;
    .registers 5

    iget-byte p2, p0, Lzl;->a:B

    iget-object p3, p0, Lzl;->c:Lpde;

    iget-object p0, p0, Lzl;->b:Lcom/opera/android/BrowserActivity;

    packed-switch p2, :pswitch_data_2c

    new-instance p2, Llel;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lvml;->d:Lumi;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    invoke-direct {p2, p0, p3, p1, v0}, Llel;-><init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;Lumi;)V

    return-object p2

    :pswitch_18
    new-instance p2, Ltqh;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p0, p3, p1}, Ltqh;-><init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;)V

    return-object p2

    :pswitch_22
    new-instance p2, Lsl;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p0, p3, p1}, Lsl;-><init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;)V

    return-object p2

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_22
        :pswitch_18
    .end packed-switch
.end method
