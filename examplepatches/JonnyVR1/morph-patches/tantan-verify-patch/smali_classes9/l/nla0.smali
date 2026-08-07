.class public final synthetic Ll/nla0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/oma0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/oma0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nla0;->a:Ll/oma0;

    iput p2, p0, Ll/nla0;->b:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nla0;->a:Ll/oma0;

    iget p0, p0, Ll/nla0;->b:I

    invoke-static {v0, p0}, Ll/ima0;->G(Ll/oma0;I)V

    return-void
.end method
