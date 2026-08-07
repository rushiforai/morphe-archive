.class public final synthetic Ll/hqi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hqi0;->a:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;

    iput p2, p0, Ll/hqi0;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hqi0;->a:Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;

    iget p0, p0, Ll/hqi0;->b:I

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;->Z1(Lcom/p1/mobile/putong/ui/sign/TencentSignActivity;ILandroid/content/DialogInterface;I)V

    return-void
.end method
