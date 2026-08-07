.class public final synthetic Ll/rzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tzk;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/tzk;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rzk;->a:Ll/tzk;

    iput p2, p0, Ll/rzk;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rzk;->a:Ll/tzk;

    iget p0, p0, Ll/rzk;->b:I

    invoke-static {v0, p0}, Ll/tzk;->c(Ll/tzk;I)V

    return-void
.end method
