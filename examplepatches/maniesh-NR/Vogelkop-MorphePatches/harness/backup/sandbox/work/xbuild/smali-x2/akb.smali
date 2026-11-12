.class public final Lakb;
.super Lzjb;
.source "SourceFile"


# instance fields
.field public final a:La26;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lg4a;->o:Lg4a;

    iput-object v0, p0, Lakb;->a:La26;

    return-void
.end method


# virtual methods
.method public final b()La26;
    .registers 1

    iget-object p0, p0, Lakb;->a:La26;

    return-object p0
.end method
