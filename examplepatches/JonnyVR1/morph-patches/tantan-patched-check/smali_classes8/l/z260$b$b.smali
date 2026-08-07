.class public Ll/z260$b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z260$b;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/z260$b;


# direct methods
.method public constructor <init>(Ll/z260$b;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z260$b$b;->b:Ll/z260$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z260$b$b;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z260$b$b;->b:Ll/z260$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z260$b$b;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/z260$b;->g(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
