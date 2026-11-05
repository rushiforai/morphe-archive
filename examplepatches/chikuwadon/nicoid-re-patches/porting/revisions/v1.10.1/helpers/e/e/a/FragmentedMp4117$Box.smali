.class final Le/e/a/FragmentedMp4117$Box;
.super Ljava/lang/Object;
.source "FragmentedMp4117.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FragmentedMp4117;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Box"
.end annotation


# instance fields
.field data:J

.field end:J

.field start:J

.field type:Ljava/lang/String;


# direct methods
.method constructor <init>(JJJLjava/lang/String;)V
    .registers 8

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Le/e/a/FragmentedMp4117$Box;->start:J

    iput-wide p3, p0, Le/e/a/FragmentedMp4117$Box;->data:J

    iput-wide p5, p0, Le/e/a/FragmentedMp4117$Box;->end:J

    iput-object p7, p0, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    return-void
.end method
