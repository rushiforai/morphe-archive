.class public final synthetic Ll/exs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/kxs;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/kxs;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/exs;->a:Ll/kxs;

    iput p2, p0, Ll/exs;->b:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/exs;->a:Ll/kxs;

    iget p0, p0, Ll/exs;->b:I

    invoke-static {v0, p0}, Ll/kxs;->e(Ll/kxs;I)V

    return-void
.end method
