.class public final Ll/c2u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/har0;


# instance fields
.field public final a:Ll/g2u0;

.field public final b:Ll/o7w0;


# direct methods
.method public constructor <init>(Ll/g2u0;Ll/o7w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c2u0;->a:Ll/g2u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c2u0;->b:Ll/o7w0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAdClicked()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c2u0;->b:Ll/o7w0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/c2u0;->a:Ll/g2u0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/g2u0;->c(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
