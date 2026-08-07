.class public final synthetic Ll/kio;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pio;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/pio;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kio;->a:Ll/pio;

    iput p2, p0, Ll/kio;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kio;->a:Ll/pio;

    iget p0, p0, Ll/kio;->b:I

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/pio;->i(Ll/pio;ILandroid/view/View;)V

    return-void
.end method
