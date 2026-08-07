.class public final Ll/z1$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/z1$b;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/z1$b;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/z1$b;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(IILjava/lang/String;Ll/z1$a;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Ll/z1$b;-><init>(IILjava/lang/String;)V

    return-void
.end method
