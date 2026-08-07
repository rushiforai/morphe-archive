.class public final synthetic Ll/vz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/f05;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/f05;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vz4;->a:Ll/f05;

    iput-object p2, p0, Ll/vz4;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vz4;->a:Ll/f05;

    iget-object p0, p0, Ll/vz4;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/f05;->S3(Ll/f05;Ljava/lang/String;)V

    return-void
.end method
