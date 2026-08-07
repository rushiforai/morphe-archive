.class public final synthetic Ll/fi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hi2;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/hi2;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fi2;->a:Ll/hi2;

    iput p2, p0, Ll/fi2;->b:I

    iput-object p3, p0, Ll/fi2;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fi2;->a:Ll/hi2;

    iget v1, p0, Ll/fi2;->b:I

    iget-object p0, p0, Ll/fi2;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/hi2;->i(Ll/hi2;ILjava/lang/String;)V

    return-void
.end method
