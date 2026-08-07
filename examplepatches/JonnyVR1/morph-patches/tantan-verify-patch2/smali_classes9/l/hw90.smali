.class public final synthetic Ll/hw90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/mw90;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/mw90;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hw90;->a:Ll/mw90;

    iput p2, p0, Ll/hw90;->b:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hw90;->a:Ll/mw90;

    iget p0, p0, Ll/hw90;->b:I

    invoke-static {v0, p0}, Ll/mw90;->e(Ll/mw90;I)V

    return-void
.end method
