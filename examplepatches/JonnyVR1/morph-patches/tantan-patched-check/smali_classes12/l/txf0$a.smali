.class public Ll/txf0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/txf0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/txf0;->e(Ll/xs4;)Ll/txf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xs4;


# direct methods
.method public constructor <init>(Ll/xs4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/txf0$a;->a:Ll/xs4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/txf0;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/txf0$a;->b(Ll/txf0;Ljava/lang/CharSequence;)Ll/txf0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/txf0;Ljava/lang/CharSequence;)Ll/txf0$b;
    .locals 1

    .line 1
    new-instance v0, Ll/txf0$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/txf0$a$a;-><init>(Ll/txf0$a;Ll/txf0;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
