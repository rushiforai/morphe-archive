.class public final synthetic Ll/syn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/bzn;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/bzn;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/syn;->a:Ll/bzn;

    iput p2, p0, Ll/syn;->b:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/syn;->a:Ll/bzn;

    iget p0, p0, Ll/syn;->b:I

    invoke-static {v0, p0}, Ll/bzn;->c(Ll/bzn;I)V

    return-void
.end method
