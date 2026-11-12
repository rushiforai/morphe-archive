.class public final Lyf1;
.super Ls43;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public final d:Lkw3;


# direct methods
.method public constructor <init>(Lumi;Lkw3;)V
    .registers 3

    invoke-direct {p0, p1}, Ls43;-><init>(Lumi;)V

    iput-object p2, p0, Lyf1;->d:Lkw3;

    return-void
.end method


# virtual methods
.method public final b()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Lyf1;->d:Lkw3;

    invoke-virtual {p0}, Lkw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    return-object p0
.end method
