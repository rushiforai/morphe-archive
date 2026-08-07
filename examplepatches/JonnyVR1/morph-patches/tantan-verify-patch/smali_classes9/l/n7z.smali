.class public final synthetic Ll/n7z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n7z;->a:Ljava/lang/String;

    iput p2, p0, Ll/n7z;->b:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n7z;->a:Ljava/lang/String;

    iget p0, p0, Ll/n7z;->b:I

    invoke-static {v0, p0}, Ll/nbz;->n0(Ljava/lang/String;I)V

    return-void
.end method
