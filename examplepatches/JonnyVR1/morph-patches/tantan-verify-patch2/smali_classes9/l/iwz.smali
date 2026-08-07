.class public final synthetic Ll/iwz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/ui/bubble/a$d;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/yxz;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iwz;->a:Ll/yxz;

    iput p2, p0, Ll/iwz;->b:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iwz;->a:Ll/yxz;

    iget p0, p0, Ll/iwz;->b:I

    invoke-static {v0, p0, p1}, Ll/yxz;->L2(Ll/yxz;ILandroid/view/View;)V

    return-void
.end method
