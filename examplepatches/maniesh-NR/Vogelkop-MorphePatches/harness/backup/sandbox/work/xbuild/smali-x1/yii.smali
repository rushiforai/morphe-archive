.class public final synthetic Lyii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;B)V
    .registers 3

    iput-byte p2, p0, Lyii;->a:B

    iput-object p1, p0, Lyii;->b:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lyii;->a:B

    iget-object p0, p0, Lyii;->b:Landroid/net/Uri;

    check-cast p1, Landroid/content/ContentResolver;

    packed-switch v0, :pswitch_data_14

    :try_start_9
    invoke-static {p1, p0}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_c} :catch_c

    :catch_c
    const/4 p0, 0x0

    return-object p0

    :pswitch_e
    invoke-static {p1, p0}, Lrf7;->k(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/util/HashMap;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
