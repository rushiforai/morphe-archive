.class public final Lzo7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcp7;


# instance fields
.field public final a:Lode;

.field public final b:Lode;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    sget-object v1, Lbp7;->a:Lbp7;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lzo7;->a:Lode;

    iput-object v0, p0, Lzo7;->b:Lode;

    return-void
.end method


# virtual methods
.method public final getState()Lekc;
    .registers 1

    iget-object p0, p0, Lzo7;->b:Lode;

    return-object p0
.end method
