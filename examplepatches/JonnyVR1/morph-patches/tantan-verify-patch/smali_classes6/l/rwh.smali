.class public final synthetic Ll/rwh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cxh;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/cxh;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rwh;->a:Ll/cxh;

    iput p2, p0, Ll/rwh;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rwh;->a:Ll/cxh;

    iget p0, p0, Ll/rwh;->b:I

    invoke-static {v0, p0}, Ll/cxh;->p(Ll/cxh;I)V

    return-void
.end method
