.class public final synthetic Ll/h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fm50;


# instance fields
.field public final synthetic a:Ll/i0$a;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/i0$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h0;->a:Ll/i0$a;

    iput-object p2, p0, Ll/h0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h0;->a:Ll/i0$a;

    iget-object p0, p0, Ll/h0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/i0;->a(Ll/i0$a;Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method
