.class public final synthetic Ll/jzz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qzz;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/qzz;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jzz;->a:Ll/qzz;

    iput p2, p0, Ll/jzz;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jzz;->a:Ll/qzz;

    iget p0, p0, Ll/jzz;->b:I

    invoke-static {v0, p0}, Ll/qzz;->f(Ll/qzz;I)V

    return-void
.end method
