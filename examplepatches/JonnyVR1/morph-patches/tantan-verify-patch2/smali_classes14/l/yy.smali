.class public final synthetic Ll/yy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r00;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/r00;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yy;->a:Ll/r00;

    iput p2, p0, Ll/yy;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yy;->a:Ll/r00;

    iget p0, p0, Ll/yy;->b:I

    invoke-static {v0, p0}, Ll/r00;->m0(Ll/r00;I)V

    return-void
.end method
