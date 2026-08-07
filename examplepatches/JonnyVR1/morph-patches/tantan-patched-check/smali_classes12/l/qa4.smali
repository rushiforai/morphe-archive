.class public final synthetic Ll/qa4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fb4;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Ll/fb4;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qa4;->a:Ll/fb4;

    iput p2, p0, Ll/qa4;->b:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qa4;->a:Ll/fb4;

    iget p0, p0, Ll/qa4;->b:F

    invoke-static {v0, p0}, Ll/fb4;->K(Ll/fb4;F)V

    return-void
.end method
