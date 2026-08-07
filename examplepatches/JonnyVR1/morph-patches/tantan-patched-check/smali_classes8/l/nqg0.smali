.class public final synthetic Ll/nqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sfg0;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/sfg0;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nqg0;->a:Ll/sfg0;

    iput p2, p0, Ll/nqg0;->b:I

    iput-object p3, p0, Ll/nqg0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nqg0;->a:Ll/sfg0;

    iget v1, p0, Ll/nqg0;->b:I

    iget-object p0, p0, Ll/nqg0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/usg0;->b(Ll/sfg0;ILjava/lang/String;)V

    return-void
.end method
