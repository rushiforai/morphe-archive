.class public final synthetic Ll/u9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ugy;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/ugy;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u9;->a:Ll/ugy;

    iput p2, p0, Ll/u9;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u9;->a:Ll/ugy;

    iget p0, p0, Ll/u9;->b:I

    invoke-static {v0, p0}, Ll/y9$a;->d(Ll/ugy;I)V

    return-void
.end method
