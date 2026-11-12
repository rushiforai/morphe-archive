.class public final synthetic Li2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/import_data/ImportChromeBookmarksActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/import_data/ImportChromeBookmarksActivity;B)V
    .registers 3

    iput-byte p2, p0, Li2b;->a:B

    iput-object p1, p0, Li2b;->b:Lcom/opera/android/import_data/ImportChromeBookmarksActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Li2b;->a:B

    iget-object p0, p0, Li2b;->b:Lcom/opera/android/import_data/ImportChromeBookmarksActivity;

    packed-switch v0, :pswitch_data_1e

    sget v0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->b0:I

    invoke-virtual {p0}, Ll2b;->B0()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12
    sget v0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->b0:I

    invoke-virtual {p0}, Ll2b;->B0()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
