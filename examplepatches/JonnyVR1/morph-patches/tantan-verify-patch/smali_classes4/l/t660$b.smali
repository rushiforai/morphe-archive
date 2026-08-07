.class public Ll/t660$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/t660;->f(Ljava/lang/String;I)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t660$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput p2, p0, Ll/t660$b;->b:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t660$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget p0, p0, Ll/t660$b;->b:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/t660;->a(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
