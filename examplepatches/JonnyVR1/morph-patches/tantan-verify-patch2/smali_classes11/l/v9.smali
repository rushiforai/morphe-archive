.class public final synthetic Ll/v9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/ugy;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/x20;Ll/ugy;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v9;->a:Ll/x20;

    iput-object p2, p0, Ll/v9;->b:Ll/ugy;

    iput p3, p0, Ll/v9;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v9;->a:Ll/x20;

    iget-object v1, p0, Ll/v9;->b:Ll/ugy;

    iget p0, p0, Ll/v9;->c:I

    invoke-static {v0, v1, p0}, Ll/y9$a;->e(Ll/x20;Ll/ugy;I)V

    return-void
.end method
